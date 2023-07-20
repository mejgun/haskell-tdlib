{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetArchiveChatListSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ArchiveChatListSettings as ArchiveChatListSettings
import qualified Utils as U

-- |
-- Changes settings for automatic moving of chats to and from the Archive chat lists @settings New settings
data SetArchiveChatListSettings = SetArchiveChatListSettings
  { -- |
    settings :: Maybe ArchiveChatListSettings.ArchiveChatListSettings
  }
  deriving (Eq)

instance Show SetArchiveChatListSettings where
  show
    SetArchiveChatListSettings
      { settings = settings_
      } =
      "SetArchiveChatListSettings"
        ++ U.cc
          [ U.p "settings" settings_
          ]

instance T.ToJSON SetArchiveChatListSettings where
  toJSON
    SetArchiveChatListSettings
      { settings = settings_
      } =
      A.object
        [ "@type" A..= T.String "setArchiveChatListSettings",
          "settings" A..= settings_
        ]
