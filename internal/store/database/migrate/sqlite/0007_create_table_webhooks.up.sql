CREATE TABLE webhooks (
webhook_id INTEGER PRIMARY KEY AUTOINCREMENT
,webhook_version INTEGER NOT NULL DEFAULT 0
,webhook_created_by INTEGER NOT NULL
,webhook_created BIGINT NOT NULL
,webhook_updated BIGINT NOT NULL
,webhook_space_id INTEGER
,webhook_repo_id INTEGER
,webhook_url TEXT NOT NULL
,webhook_secret TEXT
,webhook_enabled BOOLEAN NOT NULL
,webhook_insecure BOOLEAN NOT NULL
,webhook_triggers TEXT
,CONSTRAINT fk_webhook_created_by FOREIGN KEY (webhook_created_by)
    REFERENCES principals (principal_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
,CONSTRAINT fk_webhook_space_id FOREIGN KEY (webhook_space_id)
    REFERENCES spaces (space_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
,CONSTRAINT fk_webhook_repo_id FOREIGN KEY (webhook_repo_id)
    REFERENCES repositories (repo_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);
