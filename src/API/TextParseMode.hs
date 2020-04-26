-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TextParseMode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Describes the way the text should be parsed for TextEntities
data TextParseMode = 
 TextParseModeMarkdown { version :: Maybe Int }  
 | TextParseModeHTML deriving (Show, Eq)

instance T.ToJSON TextParseMode where
 toJSON (TextParseModeMarkdown { version = version }) =
  A.object [ "@type" A..= T.String "textParseModeMarkdown", "version" A..= version ]

 toJSON (TextParseModeHTML {  }) =
  A.object [ "@type" A..= T.String "textParseModeHTML" ]

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
    version <- mconcat [ o A..:? "version", readMaybe <$> (o A..: "version" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ TextParseModeMarkdown { version = version }

   parseTextParseModeHTML :: A.Value -> T.Parser TextParseMode
   parseTextParseModeHTML = A.withObject "TextParseModeHTML" $ \o -> do
    return $ TextParseModeHTML {  }