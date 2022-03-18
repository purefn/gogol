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
-- Module      : Gogol.AppsCalendar.Calendar.CalendarList.Update
-- Copyright   : (c) 2015-2022 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+gogol@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Updates an existing calendar on the user\'s calendar list.
--
-- /See:/ <https://developers.google.com/google-apps/calendar/firstapp Calendar API Reference> for @calendar.calendarList.update@.
module Gogol.AppsCalendar.Calendar.CalendarList.Update
    (
    -- * Resource
      CalendarCalendarListUpdateResource

    -- ** Constructing a Request
    , newCalendarCalendarListUpdate
    , CalendarCalendarListUpdate
    ) where

import qualified Gogol.Prelude as Core
import Gogol.AppsCalendar.Types

-- | A resource alias for @calendar.calendarList.update@ method which the
-- 'CalendarCalendarListUpdate' request conforms to.
type CalendarCalendarListUpdateResource =
     "calendar" Core.:>
       "v3" Core.:>
         "users" Core.:>
           "me" Core.:>
             "calendarList" Core.:>
               Core.Capture "calendarId" Core.Text Core.:>
                 Core.QueryParam "colorRgbFormat" Core.Bool Core.:>
                   Core.QueryParam "alt" Core.AltJSON Core.:>
                     Core.ReqBody '[Core.JSON] CalendarListEntry Core.:>
                       Core.Put '[Core.JSON] CalendarListEntry

-- | Updates an existing calendar on the user\'s calendar list.
--
-- /See:/ 'newCalendarCalendarListUpdate' smart constructor.
data CalendarCalendarListUpdate = CalendarCalendarListUpdate
    {
      -- | Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the \"primary\" keyword.
      calendarId :: Core.Text
      -- | Whether to use the foregroundColor and backgroundColor fields to write the calendar colors (RGB). If this feature is used, the index-based colorId field will be set to the best matching option automatically. Optional. The default is False.
    , colorRgbFormat :: (Core.Maybe Core.Bool)
      -- | Multipart request metadata.
    , payload :: CalendarListEntry
    }
    deriving (Core.Eq, Core.Show, Core.Generic)

-- | Creates a value of 'CalendarCalendarListUpdate' with the minimum fields required to make a request.
newCalendarCalendarListUpdate 
    ::  Core.Text
       -- ^  Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the \"primary\" keyword. See 'calendarId'.
    -> CalendarListEntry
       -- ^  Multipart request metadata. See 'payload'.
    -> CalendarCalendarListUpdate
newCalendarCalendarListUpdate calendarId payload =
  CalendarCalendarListUpdate
    {calendarId = calendarId, colorRgbFormat = Core.Nothing, payload = payload}

instance Core.GoogleRequest
           CalendarCalendarListUpdate
         where
        type Rs CalendarCalendarListUpdate =
             CalendarListEntry
        type Scopes CalendarCalendarListUpdate =
             '["https://www.googleapis.com/auth/calendar"]
        requestClient CalendarCalendarListUpdate{..}
          = go calendarId colorRgbFormat
              (Core.Just Core.AltJSON)
              payload
              appsCalendarService
          where go
                  = Core.buildClient
                      (Core.Proxy ::
                         Core.Proxy CalendarCalendarListUpdateResource)
                      Core.mempty

