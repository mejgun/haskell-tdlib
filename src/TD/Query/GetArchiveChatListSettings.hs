{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetArchiveChatListSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns settings for automatic moving of chats to and from the Archive chat lists
data GetArchiveChatListSettings = GetArchiveChatListSettings
  {
  }
  deriving (Eq)

instance Show GetArchiveChatListSettings where
  show GetArchiveChatListSettings =
    "GetArchiveChatListSettings"
      ++ U.cc
        []

instance T.ToJSON GetArchiveChatListSettings where
  toJSON GetArchiveChatListSettings =
    A.object
      [ "@type" A..= T.String "getArchiveChatListSettings"
      ]
