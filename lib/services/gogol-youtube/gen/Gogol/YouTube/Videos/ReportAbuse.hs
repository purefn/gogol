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
-- Module      : Gogol.YouTube.Videos.ReportAbuse
-- Copyright   : (c) 2015-2022 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+gogol@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Report abuse for a video.
--
-- /See:/ <https://developers.google.com/youtube/ YouTube Data API v3 Reference> for @youtube.videos.reportAbuse@.
module Gogol.YouTube.Videos.ReportAbuse
  ( -- * Resource
    YouTubeVideosReportAbuseResource,

    -- ** Constructing a Request
    newYouTubeVideosReportAbuse,
    YouTubeVideosReportAbuse,
  )
where

import qualified Gogol.Prelude as Core
import Gogol.YouTube.Types

-- | A resource alias for @youtube.videos.reportAbuse@ method which the
-- 'YouTubeVideosReportAbuse' request conforms to.
type YouTubeVideosReportAbuseResource =
  "youtube"
    Core.:> "v3"
    Core.:> "videos"
    Core.:> "reportAbuse"
    Core.:> Core.QueryParam "$.xgafv" Xgafv
    Core.:> Core.QueryParam "access_token" Core.Text
    Core.:> Core.QueryParam "callback" Core.Text
    Core.:> Core.QueryParam "onBehalfOfContentOwner" Core.Text
    Core.:> Core.QueryParam "uploadType" Core.Text
    Core.:> Core.QueryParam "upload_protocol" Core.Text
    Core.:> Core.QueryParam "alt" Core.AltJSON
    Core.:> Core.ReqBody '[Core.JSON] VideoAbuseReport
    Core.:> Core.Post '[Core.JSON] ()

-- | Report abuse for a video.
--
-- /See:/ 'newYouTubeVideosReportAbuse' smart constructor.
data YouTubeVideosReportAbuse = YouTubeVideosReportAbuse
  { -- | V1 error format.
    xgafv :: (Core.Maybe Xgafv),
    -- | OAuth access token.
    accessToken :: (Core.Maybe Core.Text),
    -- | JSONP
    callback :: (Core.Maybe Core.Text),
    -- | /Note:/ This parameter is intended exclusively for YouTube content partners. The /onBehalfOfContentOwner/ parameter indicates that the request\'s authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.
    onBehalfOfContentOwner :: (Core.Maybe Core.Text),
    -- | Multipart request metadata.
    payload :: VideoAbuseReport,
    -- | Legacy upload protocol for media (e.g. \"media\", \"multipart\").
    uploadType :: (Core.Maybe Core.Text),
    -- | Upload protocol for media (e.g. \"raw\", \"multipart\").
    uploadProtocol :: (Core.Maybe Core.Text)
  }
  deriving (Core.Eq, Core.Show, Core.Generic)

-- | Creates a value of 'YouTubeVideosReportAbuse' with the minimum fields required to make a request.
newYouTubeVideosReportAbuse ::
  -- |  Multipart request metadata. See 'payload'.
  VideoAbuseReport ->
  YouTubeVideosReportAbuse
newYouTubeVideosReportAbuse payload =
  YouTubeVideosReportAbuse
    { xgafv = Core.Nothing,
      accessToken = Core.Nothing,
      callback = Core.Nothing,
      onBehalfOfContentOwner = Core.Nothing,
      payload = payload,
      uploadType = Core.Nothing,
      uploadProtocol = Core.Nothing
    }

instance Core.GoogleRequest YouTubeVideosReportAbuse where
  type Rs YouTubeVideosReportAbuse = ()
  type
    Scopes YouTubeVideosReportAbuse =
      '[ "https://www.googleapis.com/auth/youtube",
         "https://www.googleapis.com/auth/youtube.force-ssl",
         "https://www.googleapis.com/auth/youtubepartner"
       ]
  requestClient YouTubeVideosReportAbuse {..} =
    go
      xgafv
      accessToken
      callback
      onBehalfOfContentOwner
      uploadType
      uploadProtocol
      (Core.Just Core.AltJSON)
      payload
      youTubeService
    where
      go =
        Core.buildClient
          ( Core.Proxy ::
              Core.Proxy YouTubeVideosReportAbuseResource
          )
          Core.mempty
