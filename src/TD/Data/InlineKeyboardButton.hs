{-# LANGUAGE OverloadedStrings #-}

module TD.Data.InlineKeyboardButton where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InlineKeyboardButtonType as InlineKeyboardButtonType
import qualified Utils as U

data InlineKeyboardButton = -- | Represents a single button in an inline keyboard @text Text of the button @type Type of the button
  InlineKeyboardButton
  { -- |
    _type :: Maybe InlineKeyboardButtonType.InlineKeyboardButtonType,
    -- |
    text :: Maybe String
  }
  deriving (Eq)

instance Show InlineKeyboardButton where
  show
    InlineKeyboardButton
      { _type = _type,
        text = text
      } =
      "InlineKeyboardButton"
        ++ U.cc
          [ U.p "_type" _type,
            U.p "text" text
          ]

instance T.FromJSON InlineKeyboardButton where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inlineKeyboardButton" -> parseInlineKeyboardButton v
      _ -> mempty
    where
      parseInlineKeyboardButton :: A.Value -> T.Parser InlineKeyboardButton
      parseInlineKeyboardButton = A.withObject "InlineKeyboardButton" $ \o -> do
        _type_ <- o A..:? "type"
        text_ <- o A..:? "text"
        return $ InlineKeyboardButton {_type = _type_, text = text_}
  parseJSON _ = mempty

instance T.ToJSON InlineKeyboardButton where
  toJSON
    InlineKeyboardButton
      { _type = _type,
        text = text
      } =
      A.object
        [ "@type" A..= T.String "inlineKeyboardButton",
          "type" A..= _type,
          "text" A..= text
        ]
