{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.TextParseMode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes the way the text needs to be parsed for TextEntities
data TextParseMode
  = -- | The text uses Markdown-style formatting
    TextParseModeMarkdown
      { -- | Version of the parser: 0 or 1 - Telegram Bot API "Markdown" parse mode, 2 - Telegram Bot API "MarkdownV2" parse mode
        version :: Maybe Int
      }
  | -- | The text uses HTML-style formatting. The same as Telegram Bot API "HTML" parse mode
    TextParseModeHTML
  deriving (Eq)

instance Show TextParseMode where
  show
    TextParseModeMarkdown
      { version = version
      } =
      "TextParseModeMarkdown"
        ++ U.cc
          [ U.p "version" version
          ]
  show TextParseModeHTML =
    "TextParseModeHTML"
      ++ U.cc
        []

instance T.FromJSON TextParseMode where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "textParseModeMarkdown" -> parseTextParseModeMarkdown v
      "textParseModeHTML" -> parseTextParseModeHTML v
      _ -> fail ""
    where
      parseTextParseModeMarkdown :: A.Value -> T.Parser TextParseMode
      parseTextParseModeMarkdown = A.withObject "TextParseModeMarkdown" $ \o -> do
        version_ <- mconcat [o A..:? "version", U.rm <$> (o A..: "version" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ TextParseModeMarkdown {version = version_}

      parseTextParseModeHTML :: A.Value -> T.Parser TextParseMode
      parseTextParseModeHTML = A.withObject "TextParseModeHTML" $ \o -> do
        return $ TextParseModeHTML {}
  parseJSON _ = fail ""

instance T.ToJSON TextParseMode where
  toJSON
    TextParseModeMarkdown
      { version = version
      } =
      A.object
        [ "@type" A..= T.String "textParseModeMarkdown",
          "version" A..= version
        ]
  toJSON TextParseModeHTML =
    A.object
      [ "@type" A..= T.String "textParseModeHTML"
      ]
