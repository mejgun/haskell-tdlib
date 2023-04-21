{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetChatBackground where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.BackgroundType as BackgroundType
import qualified TD.Data.InputBackground as InputBackground
import qualified Utils as U

-- |
-- Changes the background in a specific chat. Supported only in private and secret chats with non-deleted users
data SetChatBackground = SetChatBackground
  { -- | Dimming of the background in dark themes, as a percentage; 0-100
    dark_theme_dimming :: Maybe Int,
    -- | Background type; pass null to remove the current background
    _type :: Maybe BackgroundType.BackgroundType,
    -- | The input background to use; pass null to create a new filled background or to remove the current background
    background :: Maybe InputBackground.InputBackground,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatBackground where
  show
    SetChatBackground
      { dark_theme_dimming = dark_theme_dimming_,
        _type = _type_,
        background = background_,
        chat_id = chat_id_
      } =
      "SetChatBackground"
        ++ U.cc
          [ U.p "dark_theme_dimming" dark_theme_dimming_,
            U.p "_type" _type_,
            U.p "background" background_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SetChatBackground where
  toJSON
    SetChatBackground
      { dark_theme_dimming = dark_theme_dimming_,
        _type = _type_,
        background = background_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setChatBackground",
          "dark_theme_dimming" A..= dark_theme_dimming_,
          "type" A..= _type_,
          "background" A..= background_,
          "chat_id" A..= chat_id_
        ]
