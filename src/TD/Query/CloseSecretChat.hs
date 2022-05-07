{-# LANGUAGE OverloadedStrings #-}

module TD.Query.CloseSecretChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Closes a secret chat, effectively transferring its state to secretChatStateClosed @secret_chat_id Secret chat identifier
data CloseSecretChat = CloseSecretChat
  { -- |
    secret_chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show CloseSecretChat where
  show
    CloseSecretChat
      { secret_chat_id = secret_chat_id
      } =
      "CloseSecretChat"
        ++ U.cc
          [ U.p "secret_chat_id" secret_chat_id
          ]

instance T.ToJSON CloseSecretChat where
  toJSON
    CloseSecretChat
      { secret_chat_id = secret_chat_id
      } =
      A.object
        [ "@type" A..= T.String "closeSecretChat",
          "secret_chat_id" A..= secret_chat_id
        ]
