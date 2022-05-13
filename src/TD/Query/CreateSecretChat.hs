{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CreateSecretChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns an existing chat corresponding to a known secret chat @secret_chat_id Secret chat identifier
data CreateSecretChat = CreateSecretChat
  { -- |
    secret_chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show CreateSecretChat where
  show
    CreateSecretChat
      { secret_chat_id = secret_chat_id_
      } =
      "CreateSecretChat"
        ++ U.cc
          [ U.p "secret_chat_id" secret_chat_id_
          ]

instance T.ToJSON CreateSecretChat where
  toJSON
    CreateSecretChat
      { secret_chat_id = secret_chat_id_
      } =
      A.object
        [ "@type" A..= T.String "createSecretChat",
          "secret_chat_id" A..= secret_chat_id_
        ]
