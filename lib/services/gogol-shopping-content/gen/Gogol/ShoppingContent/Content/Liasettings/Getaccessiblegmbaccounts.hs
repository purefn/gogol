{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- |
-- Module      : Gogol.ShoppingContent.Content.Liasettings.Getaccessiblegmbaccounts
-- Copyright   : (c) 2015-2022 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+gogol@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Retrieves the list of accessible Business Profiles.
--
-- /See:/ <https://developers.google.com/shopping-content/v2/ Content API for Shopping Reference> for @content.liasettings.getaccessiblegmbaccounts@.
module Gogol.ShoppingContent.Content.Liasettings.Getaccessiblegmbaccounts
  ( -- * Resource
    ContentLiasettingsGetaccessiblegmbaccountsResource,

    -- ** Constructing a Request
    newContentLiasettingsGetaccessiblegmbaccounts,
    ContentLiasettingsGetaccessiblegmbaccounts,
  )
where

import qualified Gogol.Prelude as Core
import Gogol.ShoppingContent.Types

-- | A resource alias for @content.liasettings.getaccessiblegmbaccounts@ method which the
-- 'ContentLiasettingsGetaccessiblegmbaccounts' request conforms to.
type ContentLiasettingsGetaccessiblegmbaccountsResource =
  "content"
    Core.:> "v2.1"
    Core.:> Core.Capture "merchantId" Core.Word64
    Core.:> "liasettings"
    Core.:> Core.Capture "accountId" Core.Word64
    Core.:> "accessiblegmbaccounts"
    Core.:> Core.QueryParam "$.xgafv" Xgafv
    Core.:> Core.QueryParam "access_token" Core.Text
    Core.:> Core.QueryParam "callback" Core.Text
    Core.:> Core.QueryParam "uploadType" Core.Text
    Core.:> Core.QueryParam "upload_protocol" Core.Text
    Core.:> Core.QueryParam "alt" Core.AltJSON
    Core.:> Core.Get
              '[Core.JSON]
              LiasettingsGetAccessibleGmbAccountsResponse

-- | Retrieves the list of accessible Business Profiles.
--
-- /See:/ 'newContentLiasettingsGetaccessiblegmbaccounts' smart constructor.
data ContentLiasettingsGetaccessiblegmbaccounts = ContentLiasettingsGetaccessiblegmbaccounts
  { -- | V1 error format.
    xgafv :: (Core.Maybe Xgafv),
    -- | OAuth access token.
    accessToken :: (Core.Maybe Core.Text),
    -- | The ID of the account for which to retrieve accessible Business Profiles.
    accountId :: Core.Word64,
    -- | JSONP
    callback :: (Core.Maybe Core.Text),
    -- | The ID of the managing account. If this parameter is not the same as accountId, then this account must be a multi-client account and @accountId@ must be the ID of a sub-account of this account.
    merchantId :: Core.Word64,
    -- | Legacy upload protocol for media (e.g. \"media\", \"multipart\").
    uploadType :: (Core.Maybe Core.Text),
    -- | Upload protocol for media (e.g. \"raw\", \"multipart\").
    uploadProtocol :: (Core.Maybe Core.Text)
  }
  deriving (Core.Eq, Core.Show, Core.Generic)

-- | Creates a value of 'ContentLiasettingsGetaccessiblegmbaccounts' with the minimum fields required to make a request.
newContentLiasettingsGetaccessiblegmbaccounts ::
  -- |  The ID of the account for which to retrieve accessible Business Profiles. See 'accountId'.
  Core.Word64 ->
  -- |  The ID of the managing account. If this parameter is not the same as accountId, then this account must be a multi-client account and @accountId@ must be the ID of a sub-account of this account. See 'merchantId'.
  Core.Word64 ->
  ContentLiasettingsGetaccessiblegmbaccounts
newContentLiasettingsGetaccessiblegmbaccounts accountId merchantId =
  ContentLiasettingsGetaccessiblegmbaccounts
    { xgafv = Core.Nothing,
      accessToken = Core.Nothing,
      accountId = accountId,
      callback = Core.Nothing,
      merchantId = merchantId,
      uploadType = Core.Nothing,
      uploadProtocol = Core.Nothing
    }

instance
  Core.GoogleRequest
    ContentLiasettingsGetaccessiblegmbaccounts
  where
  type
    Rs ContentLiasettingsGetaccessiblegmbaccounts =
      LiasettingsGetAccessibleGmbAccountsResponse
  type
    Scopes
      ContentLiasettingsGetaccessiblegmbaccounts =
      '["https://www.googleapis.com/auth/content"]
  requestClient
    ContentLiasettingsGetaccessiblegmbaccounts {..} =
      go
        merchantId
        accountId
        xgafv
        accessToken
        callback
        uploadType
        uploadProtocol
        (Core.Just Core.AltJSON)
        shoppingContentService
      where
        go =
          Core.buildClient
            ( Core.Proxy ::
                Core.Proxy
                  ContentLiasettingsGetaccessiblegmbaccountsResource
            )
            Core.mempty
