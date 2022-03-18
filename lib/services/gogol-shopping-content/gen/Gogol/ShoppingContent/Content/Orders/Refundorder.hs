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
-- Module      : Gogol.ShoppingContent.Content.Orders.Refundorder
-- Copyright   : (c) 2015-2022 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+gogol@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Issues a partial or total refund for an order.
--
-- /See:/ <https://developers.google.com/shopping-content/v2/ Content API for Shopping Reference> for @content.orders.refundorder@.
module Gogol.ShoppingContent.Content.Orders.Refundorder
  ( -- * Resource
    ContentOrdersRefundorderResource,

    -- ** Constructing a Request
    newContentOrdersRefundorder,
    ContentOrdersRefundorder,
  )
where

import qualified Gogol.Prelude as Core
import Gogol.ShoppingContent.Types

-- | A resource alias for @content.orders.refundorder@ method which the
-- 'ContentOrdersRefundorder' request conforms to.
type ContentOrdersRefundorderResource =
  "content"
    Core.:> "v2.1"
    Core.:> Core.Capture "merchantId" Core.Word64
    Core.:> "orders"
    Core.:> Core.Capture "orderId" Core.Text
    Core.:> "refundorder"
    Core.:> Core.QueryParam "$.xgafv" Xgafv
    Core.:> Core.QueryParam "access_token" Core.Text
    Core.:> Core.QueryParam "callback" Core.Text
    Core.:> Core.QueryParam "uploadType" Core.Text
    Core.:> Core.QueryParam "upload_protocol" Core.Text
    Core.:> Core.QueryParam "alt" Core.AltJSON
    Core.:> Core.ReqBody '[Core.JSON] OrdersRefundOrderRequest
    Core.:> Core.Post '[Core.JSON] OrdersRefundOrderResponse

-- | Issues a partial or total refund for an order.
--
-- /See:/ 'newContentOrdersRefundorder' smart constructor.
data ContentOrdersRefundorder = ContentOrdersRefundorder
  { -- | V1 error format.
    xgafv :: (Core.Maybe Xgafv),
    -- | OAuth access token.
    accessToken :: (Core.Maybe Core.Text),
    -- | JSONP
    callback :: (Core.Maybe Core.Text),
    -- | The ID of the account that manages the order. This cannot be a multi-client account.
    merchantId :: Core.Word64,
    -- | The ID of the order to refund.
    orderId :: Core.Text,
    -- | Multipart request metadata.
    payload :: OrdersRefundOrderRequest,
    -- | Legacy upload protocol for media (e.g. \"media\", \"multipart\").
    uploadType :: (Core.Maybe Core.Text),
    -- | Upload protocol for media (e.g. \"raw\", \"multipart\").
    uploadProtocol :: (Core.Maybe Core.Text)
  }
  deriving (Core.Eq, Core.Show, Core.Generic)

-- | Creates a value of 'ContentOrdersRefundorder' with the minimum fields required to make a request.
newContentOrdersRefundorder ::
  -- |  The ID of the account that manages the order. This cannot be a multi-client account. See 'merchantId'.
  Core.Word64 ->
  -- |  The ID of the order to refund. See 'orderId'.
  Core.Text ->
  -- |  Multipart request metadata. See 'payload'.
  OrdersRefundOrderRequest ->
  ContentOrdersRefundorder
newContentOrdersRefundorder merchantId orderId payload =
  ContentOrdersRefundorder
    { xgafv = Core.Nothing,
      accessToken = Core.Nothing,
      callback = Core.Nothing,
      merchantId = merchantId,
      orderId = orderId,
      payload = payload,
      uploadType = Core.Nothing,
      uploadProtocol = Core.Nothing
    }

instance Core.GoogleRequest ContentOrdersRefundorder where
  type
    Rs ContentOrdersRefundorder =
      OrdersRefundOrderResponse
  type
    Scopes ContentOrdersRefundorder =
      '["https://www.googleapis.com/auth/content"]
  requestClient ContentOrdersRefundorder {..} =
    go
      merchantId
      orderId
      xgafv
      accessToken
      callback
      uploadType
      uploadProtocol
      (Core.Just Core.AltJSON)
      payload
      shoppingContentService
    where
      go =
        Core.buildClient
          ( Core.Proxy ::
              Core.Proxy ContentOrdersRefundorderResource
          )
          Core.mempty
