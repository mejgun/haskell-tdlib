{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InlineQueryResultsButton where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InlineQueryResultsButtonType as InlineQueryResultsButtonType
import qualified Utils as U

-- |
data InlineQueryResultsButton = -- | Represents a button to be shown above inline query results @text The text of the button @type Type of the button
  InlineQueryResultsButton
  { -- |
    _type :: Maybe InlineQueryResultsButtonType.InlineQueryResultsButtonType,
    -- |
    text :: Maybe String
  }
  deriving (Eq)

instance Show InlineQueryResultsButton where
  show
    InlineQueryResultsButton
      { _type = _type_,
        text = text_
      } =
      "InlineQueryResultsButton"
        ++ U.cc
          [ U.p "_type" _type_,
            U.p "text" text_
          ]

instance T.FromJSON InlineQueryResultsButton where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inlineQueryResultsButton" -> parseInlineQueryResultsButton v
      _ -> mempty
    where
      parseInlineQueryResultsButton :: A.Value -> T.Parser InlineQueryResultsButton
      parseInlineQueryResultsButton = A.withObject "InlineQueryResultsButton" $ \o -> do
        _type_ <- o A..:? "type"
        text_ <- o A..:? "text"
        return $ InlineQueryResultsButton {_type = _type_, text = text_}
  parseJSON _ = mempty

instance T.ToJSON InlineQueryResultsButton where
  toJSON
    InlineQueryResultsButton
      { _type = _type_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultsButton",
          "type" A..= _type_,
          "text" A..= text_
        ]
