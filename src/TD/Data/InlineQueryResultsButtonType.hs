{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InlineQueryResultsButtonType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Represents a type of a button in results of inline query
data InlineQueryResultsButtonType
  = -- | Describes the button that opens a private chat with the bot and sends a start message to the bot with the given parameter @parameter The parameter for the bot start message
    InlineQueryResultsButtonTypeStartBot
      { -- |
        parameter :: Maybe String
      }
  | -- | Describes the button that opens a Web App by calling getWebAppUrl @url An HTTP URL to pass to getWebAppUrl
    InlineQueryResultsButtonTypeWebApp
      { -- |
        url :: Maybe String
      }
  deriving (Eq)

instance Show InlineQueryResultsButtonType where
  show
    InlineQueryResultsButtonTypeStartBot
      { parameter = parameter_
      } =
      "InlineQueryResultsButtonTypeStartBot"
        ++ U.cc
          [ U.p "parameter" parameter_
          ]
  show
    InlineQueryResultsButtonTypeWebApp
      { url = url_
      } =
      "InlineQueryResultsButtonTypeWebApp"
        ++ U.cc
          [ U.p "url" url_
          ]

instance T.FromJSON InlineQueryResultsButtonType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inlineQueryResultsButtonTypeStartBot" -> parseInlineQueryResultsButtonTypeStartBot v
      "inlineQueryResultsButtonTypeWebApp" -> parseInlineQueryResultsButtonTypeWebApp v
      _ -> mempty
    where
      parseInlineQueryResultsButtonTypeStartBot :: A.Value -> T.Parser InlineQueryResultsButtonType
      parseInlineQueryResultsButtonTypeStartBot = A.withObject "InlineQueryResultsButtonTypeStartBot" $ \o -> do
        parameter_ <- o A..:? "parameter"
        return $ InlineQueryResultsButtonTypeStartBot {parameter = parameter_}

      parseInlineQueryResultsButtonTypeWebApp :: A.Value -> T.Parser InlineQueryResultsButtonType
      parseInlineQueryResultsButtonTypeWebApp = A.withObject "InlineQueryResultsButtonTypeWebApp" $ \o -> do
        url_ <- o A..:? "url"
        return $ InlineQueryResultsButtonTypeWebApp {url = url_}
  parseJSON _ = mempty

instance T.ToJSON InlineQueryResultsButtonType where
  toJSON
    InlineQueryResultsButtonTypeStartBot
      { parameter = parameter_
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultsButtonTypeStartBot",
          "parameter" A..= parameter_
        ]
  toJSON
    InlineQueryResultsButtonTypeWebApp
      { url = url_
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultsButtonTypeWebApp",
          "url" A..= url_
        ]
