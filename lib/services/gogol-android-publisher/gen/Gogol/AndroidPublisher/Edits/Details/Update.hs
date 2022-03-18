{-# LANGUAGE StrictData #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}

{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- |
-- Module      : Gogol.AndroidPublisher.Edits.Details.Update
-- Copyright   : (c) 2015-2022 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+gogol@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Updates details of an app.
--
-- /See:/ <https://developers.google.com/android-publisher Google Play Android Developer API Reference> for @androidpublisher.edits.details.update@.
module Gogol.AndroidPublisher.Edits.Details.Update
    (
    -- * Resource
      AndroidPublisherEditsDetailsUpdateResource

    -- ** Constructing a Request
    , newAndroidPublisherEditsDetailsUpdate
    , AndroidPublisherEditsDetailsUpdate
    ) where

import qualified Gogol.Prelude as Core
import Gogol.AndroidPublisher.Types

-- | A resource alias for @androidpublisher.edits.details.update@ method which the
-- 'AndroidPublisherEditsDetailsUpdate' request conforms to.
type AndroidPublisherEditsDetailsUpdateResource =
     "androidpublisher" Core.:>
       "v3" Core.:>
         "applications" Core.:>
           Core.Capture "packageName" Core.Text Core.:>
             "edits" Core.:>
               Core.Capture "editId" Core.Text Core.:>
                 "details" Core.:>
                   Core.QueryParam "$.xgafv" Xgafv Core.:>
                     Core.QueryParam "access_token" Core.Text Core.:>
                       Core.QueryParam "callback" Core.Text Core.:>
                         Core.QueryParam "uploadType" Core.Text Core.:>
                           Core.QueryParam "upload_protocol" Core.Text Core.:>
                             Core.QueryParam "alt" Core.AltJSON Core.:>
                               Core.ReqBody '[Core.JSON] AppDetails Core.:>
                                 Core.Put '[Core.JSON] AppDetails

-- | Updates details of an app.
--
-- /See:/ 'newAndroidPublisherEditsDetailsUpdate' smart constructor.
data AndroidPublisherEditsDetailsUpdate = AndroidPublisherEditsDetailsUpdate
    {
      -- | V1 error format.
      xgafv :: (Core.Maybe Xgafv)
      -- | OAuth access token.
    , accessToken :: (Core.Maybe Core.Text)
      -- | JSONP
    , callback :: (Core.Maybe Core.Text)
      -- | Identifier of the edit.
    , editId :: Core.Text
      -- | Package name of the app.
    , packageName :: Core.Text
      -- | Multipart request metadata.
    , payload :: AppDetails
      -- | Legacy upload protocol for media (e.g. \"media\", \"multipart\").
    , uploadType :: (Core.Maybe Core.Text)
      -- | Upload protocol for media (e.g. \"raw\", \"multipart\").
    , uploadProtocol :: (Core.Maybe Core.Text)
    }
    deriving (Core.Eq, Core.Show, Core.Generic)

-- | Creates a value of 'AndroidPublisherEditsDetailsUpdate' with the minimum fields required to make a request.
newAndroidPublisherEditsDetailsUpdate 
    ::  Core.Text
       -- ^  Identifier of the edit. See 'editId'.
    -> Core.Text
       -- ^  Package name of the app. See 'packageName'.
    -> AppDetails
       -- ^  Multipart request metadata. See 'payload'.
    -> AndroidPublisherEditsDetailsUpdate
newAndroidPublisherEditsDetailsUpdate editId packageName payload =
  AndroidPublisherEditsDetailsUpdate
    { xgafv = Core.Nothing
    , accessToken = Core.Nothing
    , callback = Core.Nothing
    , editId = editId
    , packageName = packageName
    , payload = payload
    , uploadType = Core.Nothing
    , uploadProtocol = Core.Nothing
    }

instance Core.GoogleRequest
           AndroidPublisherEditsDetailsUpdate
         where
        type Rs AndroidPublisherEditsDetailsUpdate =
             AppDetails
        type Scopes AndroidPublisherEditsDetailsUpdate =
             '["https://www.googleapis.com/auth/androidpublisher"]
        requestClient AndroidPublisherEditsDetailsUpdate{..}
          = go packageName editId xgafv accessToken callback
              uploadType
              uploadProtocol
              (Core.Just Core.AltJSON)
              payload
              androidPublisherService
          where go
                  = Core.buildClient
                      (Core.Proxy ::
                         Core.Proxy
                           AndroidPublisherEditsDetailsUpdateResource)
                      Core.mempty

