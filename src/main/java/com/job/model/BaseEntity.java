package com.job.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToOne;
import javax.persistence.PostUpdate;
import javax.persistence.PrePersist;

import org.springframework.security.core.context.SecurityContextHolder;

@MappedSuperclass
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class BaseEntity {

	@Column(name = "created", nullable = false)
	private LocalDateTime created;

	@Column(name = "updated", nullable = false)
	private LocalDateTime updated;

	@OneToOne
	private WebUser modifiedBy;

	public LocalDateTime getCreated() {
		return created;
	}

	public void setCreated(LocalDateTime created) {
		this.created = created;
	}

	public LocalDateTime getUpdated() {
		return updated;
	}

	public void setUpdated(LocalDateTime updated) {
		this.updated = updated;
	}

	public WebUser getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(WebUser modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	@PrePersist
	protected void onCreate() {
		this.created = LocalDateTime.now();
		this.updated = LocalDateTime.now();
		this.modifiedBy = (WebUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}

	@PostUpdate
	protected void onUpdate() {
		this.updated = LocalDateTime.now();
		this.modifiedBy = (WebUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
}
