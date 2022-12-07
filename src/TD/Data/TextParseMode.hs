{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.TextParseMode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes the way the text needs to be parsed for text entities
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
      { version = version_
      } =
      "TextParseModeMarkdown"
        ++ U.cc
          [ U.p "version" version_
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
      _ -> mempty
    where
      parseTextParseModeMarkdown :: A.Value -> T.Parser TextParseMode
      parseTextParseModeMarkdown = A.withObject "TextParseModeMarkdown" $ \o -> do
        version_ <- o A..:? "version"
        return $ TextParseModeMarkdown {version = version_}

      parseTextParseModeHTML :: A.Value -> T.Parser TextParseMode
      parseTextParseModeHTML = A.withObject "TextParseModeHTML" $ \_ -> return TextParseModeHTML
  parseJSON _ = mempty

instance T.ToJSON TextParseMode where
  toJSON
    TextParseModeMarkdown
      { version = version_
      } =
      A.object
        [ "@type" A..= T.String "textParseModeMarkdown",
          "version" A..= version_
        ]
  toJSON TextParseModeHTML =
    A.object
      [ "@type" A..= T.String "textParseModeHTML"
      ]
