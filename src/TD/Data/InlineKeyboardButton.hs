module TD.Data.InlineKeyboardButton
  ( InlineKeyboardButton(..)    
  , defaultInlineKeyboardButton 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InlineKeyboardButtonType as InlineKeyboardButtonType

data InlineKeyboardButton
  = InlineKeyboardButton -- ^ Represents a single button in an inline keyboard
    { text  :: Maybe T.Text                                            -- ^ Text of the button
    , _type :: Maybe InlineKeyboardButtonType.InlineKeyboardButtonType -- ^ Type of the button
    }
  deriving (Eq, Show)

instance I.ShortShow InlineKeyboardButton where
  shortShow InlineKeyboardButton
    { text  = text_
    , _type = _type_
    }
      = "InlineKeyboardButton"
        ++ I.cc
        [ "text"  `I.p` text_
        , "_type" `I.p` _type_
        ]

instance AT.FromJSON InlineKeyboardButton where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inlineKeyboardButton" -> parseInlineKeyboardButton v
      _                      -> mempty
    
    where
      parseInlineKeyboardButton :: A.Value -> AT.Parser InlineKeyboardButton
      parseInlineKeyboardButton = A.withObject "InlineKeyboardButton" $ \o -> do
        text_  <- o A..:?  "text"
        _type_ <- o A..:?  "type"
        pure $ InlineKeyboardButton
          { text  = text_
          , _type = _type_
          }
  parseJSON _ = mempty

instance AT.ToJSON InlineKeyboardButton where
  toJSON InlineKeyboardButton
    { text  = text_
    , _type = _type_
    }
      = A.object
        [ "@type" A..= AT.String "inlineKeyboardButton"
        , "text"  A..= text_
        , "type"  A..= _type_
        ]

defaultInlineKeyboardButton :: InlineKeyboardButton
defaultInlineKeyboardButton =
  InlineKeyboardButton
    { text  = Nothing
    , _type = Nothing
    }

