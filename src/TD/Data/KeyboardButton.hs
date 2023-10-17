module TD.Data.KeyboardButton
  ( KeyboardButton(..)    
  , defaultKeyboardButton 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.KeyboardButtonType as KeyboardButtonType

data KeyboardButton
  = KeyboardButton -- ^ Represents a single button in a bot keyboard
    { text  :: Maybe T.Text                                -- ^ Text of the button
    , _type :: Maybe KeyboardButtonType.KeyboardButtonType -- ^ Type of the button
    }
  deriving (Eq, Show)

instance I.ShortShow KeyboardButton where
  shortShow KeyboardButton
    { text  = text_
    , _type = _type_
    }
      = "KeyboardButton"
        ++ I.cc
        [ "text"  `I.p` text_
        , "_type" `I.p` _type_
        ]

instance AT.FromJSON KeyboardButton where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "keyboardButton" -> parseKeyboardButton v
      _                -> mempty
    
    where
      parseKeyboardButton :: A.Value -> AT.Parser KeyboardButton
      parseKeyboardButton = A.withObject "KeyboardButton" $ \o -> do
        text_  <- o A..:?  "text"
        _type_ <- o A..:?  "type"
        pure $ KeyboardButton
          { text  = text_
          , _type = _type_
          }
  parseJSON _ = mempty

instance AT.ToJSON KeyboardButton where
  toJSON KeyboardButton
    { text  = text_
    , _type = _type_
    }
      = A.object
        [ "@type" A..= AT.String "keyboardButton"
        , "text"  A..= text_
        , "type"  A..= _type_
        ]

defaultKeyboardButton :: KeyboardButton
defaultKeyboardButton =
  KeyboardButton
    { text  = Nothing
    , _type = Nothing
    }

