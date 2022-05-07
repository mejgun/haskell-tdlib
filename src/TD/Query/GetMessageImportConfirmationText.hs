{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetMessageImportConfirmationText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns a confirmation text to be shown to the user before starting message import
data GetMessageImportConfirmationText = GetMessageImportConfirmationText
  { -- | Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info administrator right
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetMessageImportConfirmationText where
  show
    GetMessageImportConfirmationText
      { chat_id = chat_id
      } =
      "GetMessageImportConfirmationText"
        ++ U.cc
          [ U.p "chat_id" chat_id
          ]

instance T.ToJSON GetMessageImportConfirmationText where
  toJSON
    GetMessageImportConfirmationText
      { chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getMessageImportConfirmationText",
          "chat_id" A..= chat_id
        ]
