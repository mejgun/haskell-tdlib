module TD.Data.InlineQueryResultsButton
  ( InlineQueryResultsButton(..)    
  , defaultInlineQueryResultsButton 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InlineQueryResultsButtonType as InlineQueryResultsButtonType

data InlineQueryResultsButton
  = InlineQueryResultsButton -- ^ Represents a button to be shown above inline query results
    { text  :: Maybe T.Text                                                    -- ^ The text of the button
    , _type :: Maybe InlineQueryResultsButtonType.InlineQueryResultsButtonType -- ^ Type of the button
    }
  deriving (Eq, Show)

instance I.ShortShow InlineQueryResultsButton where
  shortShow InlineQueryResultsButton
    { text  = text_
    , _type = _type_
    }
      = "InlineQueryResultsButton"
        ++ I.cc
        [ "text"  `I.p` text_
        , "_type" `I.p` _type_
        ]

instance AT.FromJSON InlineQueryResultsButton where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inlineQueryResultsButton" -> parseInlineQueryResultsButton v
      _                          -> mempty
    
    where
      parseInlineQueryResultsButton :: A.Value -> AT.Parser InlineQueryResultsButton
      parseInlineQueryResultsButton = A.withObject "InlineQueryResultsButton" $ \o -> do
        text_  <- o A..:?  "text"
        _type_ <- o A..:?  "type"
        pure $ InlineQueryResultsButton
          { text  = text_
          , _type = _type_
          }
  parseJSON _ = mempty

instance AT.ToJSON InlineQueryResultsButton where
  toJSON InlineQueryResultsButton
    { text  = text_
    , _type = _type_
    }
      = A.object
        [ "@type" A..= AT.String "inlineQueryResultsButton"
        , "text"  A..= text_
        , "type"  A..= _type_
        ]

defaultInlineQueryResultsButton :: InlineQueryResultsButton
defaultInlineQueryResultsButton =
  InlineQueryResultsButton
    { text  = Nothing
    , _type = Nothing
    }

