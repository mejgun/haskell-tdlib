{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetUserSupportInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified Utils as U

-- |
-- Sets support information for the given user; for Telegram support only @user_id User identifier @message New information message
data SetUserSupportInfo = SetUserSupportInfo
  { -- |
    message :: Maybe FormattedText.FormattedText,
    -- |
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetUserSupportInfo where
  show
    SetUserSupportInfo
      { message = message_,
        user_id = user_id_
      } =
      "SetUserSupportInfo"
        ++ U.cc
          [ U.p "message" message_,
            U.p "user_id" user_id_
          ]

instance T.ToJSON SetUserSupportInfo where
  toJSON
    SetUserSupportInfo
      { message = message_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "setUserSupportInfo",
          "message" A..= message_,
          "user_id" A..= user_id_
        ]
