{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AddApplicationChangelog where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Adds server-provided application changelog as messages to the chat 777000 (Telegram); for official applications only. Returns a 404 error if nothing changed @previous_application_version The previous application version
data AddApplicationChangelog = AddApplicationChangelog
  { -- |
    previous_application_version :: Maybe String
  }
  deriving (Eq)

instance Show AddApplicationChangelog where
  show
    AddApplicationChangelog
      { previous_application_version = previous_application_version_
      } =
      "AddApplicationChangelog"
        ++ U.cc
          [ U.p "previous_application_version" previous_application_version_
          ]

instance T.ToJSON AddApplicationChangelog where
  toJSON
    AddApplicationChangelog
      { previous_application_version = previous_application_version_
      } =
      A.object
        [ "@type" A..= T.String "addApplicationChangelog",
          "previous_application_version" A..= previous_application_version_
        ]
