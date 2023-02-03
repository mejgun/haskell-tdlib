{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleChatIsTranslatable where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the tranlatable state of a chat; for Telegram Premium users only @chat_id Chat identifier @is_translatable New value of is_translatable
data ToggleChatIsTranslatable = ToggleChatIsTranslatable
  { -- |
    is_translatable :: Maybe Bool,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleChatIsTranslatable where
  show
    ToggleChatIsTranslatable
      { is_translatable = is_translatable_,
        chat_id = chat_id_
      } =
      "ToggleChatIsTranslatable"
        ++ U.cc
          [ U.p "is_translatable" is_translatable_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ToggleChatIsTranslatable where
  toJSON
    ToggleChatIsTranslatable
      { is_translatable = is_translatable_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleChatIsTranslatable",
          "is_translatable" A..= is_translatable_,
          "chat_id" A..= chat_id_
        ]
