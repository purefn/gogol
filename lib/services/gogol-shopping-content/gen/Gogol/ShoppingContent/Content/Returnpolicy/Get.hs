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
-- Module      : Gogol.ShoppingContent.Content.Returnpolicy.Get
-- Copyright   : (c) 2015-2022 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+gogol@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Gets a return policy of the Merchant Center account.
--
-- /See:/ <https://developers.google.com/shopping-content/v2/ Content API for Shopping Reference> for @content.returnpolicy.get@.
module Gogol.ShoppingContent.Content.Returnpolicy.Get
  ( -- * Resource
    ContentReturnpolicyGetResource,

    -- ** Constructing a Request
    newContentReturnpolicyGet,
    ContentReturnpolicyGet,
  )
where

import qualified Gogol.Prelude as Core
import Gogol.ShoppingContent.Types

-- | A resource alias for @content.returnpolicy.get@ method which the
-- 'ContentReturnpolicyGet' request conforms to.
type ContentReturnpolicyGetResource =
  "content"
    Core.:> "v2.1"
    Core.:> Core.Capture "merchantId" Core.Word64
    Core.:> "returnpolicy"
    Core.:> Core.Capture "returnPolicyId" Core.Text
    Core.:> Core.QueryParam "$.xgafv" Xgafv
    Core.:> Core.QueryParam "access_token" Core.Text
    Core.:> Core.QueryParam "callback" Core.Text
    Core.:> Core.QueryParam "uploadType" Core.Text
    Core.:> Core.QueryParam "upload_protocol" Core.Text
    Core.:> Core.QueryParam "alt" Core.AltJSON
    Core.:> Core.Get '[Core.JSON] ReturnPolicy

-- | Gets a return policy of the Merchant Center account.
--
-- /See:/ 'newContentReturnpolicyGet' smart constructor.
data ContentReturnpolicyGet = ContentReturnpolicyGet
  { -- | V1 error format.
    xgafv :: (Core.Maybe Xgafv),
    -- | OAuth access token.
    accessToken :: (Core.Maybe Core.Text),
    -- | JSONP
    callback :: (Core.Maybe Core.Text),
    -- | The Merchant Center account to get a return policy for.
    merchantId :: Core.Word64,
    -- | Return policy ID generated by Google.
    returnPolicyId :: Core.Text,
    -- | Legacy upload protocol for media (e.g. \"media\", \"multipart\").
    uploadType :: (Core.Maybe Core.Text),
    -- | Upload protocol for media (e.g. \"raw\", \"multipart\").
    uploadProtocol :: (Core.Maybe Core.Text)
  }
  deriving (Core.Eq, Core.Show, Core.Generic)

-- | Creates a value of 'ContentReturnpolicyGet' with the minimum fields required to make a request.
newContentReturnpolicyGet ::
  -- |  The Merchant Center account to get a return policy for. See 'merchantId'.
  Core.Word64 ->
  -- |  Return policy ID generated by Google. See 'returnPolicyId'.
  Core.Text ->
  ContentReturnpolicyGet
newContentReturnpolicyGet merchantId returnPolicyId =
  ContentReturnpolicyGet
    { xgafv = Core.Nothing,
      accessToken = Core.Nothing,
      callback = Core.Nothing,
      merchantId = merchantId,
      returnPolicyId = returnPolicyId,
      uploadType = Core.Nothing,
      uploadProtocol = Core.Nothing
    }

instance Core.GoogleRequest ContentReturnpolicyGet where
  type Rs ContentReturnpolicyGet = ReturnPolicy
  type
    Scopes ContentReturnpolicyGet =
      '["https://www.googleapis.com/auth/content"]
  requestClient ContentReturnpolicyGet {..} =
    go
      merchantId
      returnPolicyId
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
              Core.Proxy ContentReturnpolicyGetResource
          )
          Core.mempty
