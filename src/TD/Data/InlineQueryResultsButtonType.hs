module TD.Data.InlineQueryResultsButtonType
  (InlineQueryResultsButtonType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Represents type of button in results of inline query
data InlineQueryResultsButtonType
  = InlineQueryResultsButtonTypeStartBot -- ^ Describes the button that opens a private chat with the bot and sends a start message to the bot with the given parameter
    { parameter :: Maybe T.Text -- ^ The parameter for the bot start message
    }
  | InlineQueryResultsButtonTypeWebApp -- ^ Describes the button that opens a Web App by calling getWebAppUrl
    { url :: Maybe T.Text -- ^ An HTTP URL to pass to getWebAppUrl
    }
  deriving (Eq, Show)

instance I.ShortShow InlineQueryResultsButtonType where
  shortShow InlineQueryResultsButtonTypeStartBot
    { parameter = parameter_
    }
      = "InlineQueryResultsButtonTypeStartBot"
        ++ I.cc
        [ "parameter" `I.p` parameter_
        ]
  shortShow InlineQueryResultsButtonTypeWebApp
    { url = url_
    }
      = "InlineQueryResultsButtonTypeWebApp"
        ++ I.cc
        [ "url" `I.p` url_
        ]

instance AT.FromJSON InlineQueryResultsButtonType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inlineQueryResultsButtonTypeStartBot" -> parseInlineQueryResultsButtonTypeStartBot v
      "inlineQueryResultsButtonTypeWebApp"   -> parseInlineQueryResultsButtonTypeWebApp v
      _                                      -> mempty
    
    where
      parseInlineQueryResultsButtonTypeStartBot :: A.Value -> AT.Parser InlineQueryResultsButtonType
      parseInlineQueryResultsButtonTypeStartBot = A.withObject "InlineQueryResultsButtonTypeStartBot" $ \o -> do
        parameter_ <- o A..:?  "parameter"
        pure $ InlineQueryResultsButtonTypeStartBot
          { parameter = parameter_
          }
      parseInlineQueryResultsButtonTypeWebApp :: A.Value -> AT.Parser InlineQueryResultsButtonType
      parseInlineQueryResultsButtonTypeWebApp = A.withObject "InlineQueryResultsButtonTypeWebApp" $ \o -> do
        url_ <- o A..:?  "url"
        pure $ InlineQueryResultsButtonTypeWebApp
          { url = url_
          }
  parseJSON _ = mempty

instance AT.ToJSON InlineQueryResultsButtonType where
  toJSON InlineQueryResultsButtonTypeStartBot
    { parameter = parameter_
    }
      = A.object
        [ "@type"     A..= AT.String "inlineQueryResultsButtonTypeStartBot"
        , "parameter" A..= parameter_
        ]
  toJSON InlineQueryResultsButtonTypeWebApp
    { url = url_
    }
      = A.object
        [ "@type" A..= AT.String "inlineQueryResultsButtonTypeWebApp"
        , "url"   A..= url_
        ]

