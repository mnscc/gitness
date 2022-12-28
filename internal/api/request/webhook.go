// Copyright 2022 Harness Inc. All rights reserved.
// Use of this source code is governed by the Polyform Free Trial License
// that can be found in the LICENSE.md file for this repository.

package request

import (
	"net/http"

	"github.com/harness/gitness/types"
)

const (
	PathParamWebhookID          = "webhook_id"
	PathParamWebhookExecutionID = "webhook_execution_id"
)

func GetWebhookIDFromPath(r *http.Request) (int64, error) {
	return PathParamAsInt64(r, PathParamWebhookID)
}

func GetWebhookExecutionIDFromPath(r *http.Request) (int64, error) {
	return PathParamAsInt64(r, PathParamWebhookExecutionID)
}

// ParseWebhookFilter extracts the Webhook query parameters for listing from the url.
func ParseWebhookFilter(r *http.Request) *types.WebhookFilter {
	return &types.WebhookFilter{
		Page: ParsePage(r),
		Size: ParseSize(r),
	}
}

// ParseWebhookExecutionFilter extracts the WebhookExecution query parameters for listing from the url.
func ParseWebhookExecutionFilter(r *http.Request) *types.WebhookExecutionFilter {
	return &types.WebhookExecutionFilter{
		Page: ParsePage(r),
		Size: ParseSize(r),
	}
}
