-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetWebPagePreview where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

-- |
-- 
-- Returns a web page preview by the text of the message. Do not call this function too often. Returns a 404 error if the web page has no preview 
-- 
-- __text__ Message text with formatting
data GetWebPagePreview = 

 GetWebPagePreview { text :: Maybe FormattedText.FormattedText }  deriving (Eq)

instance Show GetWebPagePreview where
 show GetWebPagePreview { text=text } =
  "GetWebPagePreview" ++ cc [p "text" text ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetWebPagePreview where
 toJSON GetWebPagePreview { text = text } =
  A.object [ "@type" A..= T.String "getWebPagePreview", "text" A..= text ]

instance T.FromJSON GetWebPagePreview where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getWebPagePreview" -> parseGetWebPagePreview v
   _ -> mempty
  where
   parseGetWebPagePreview :: A.Value -> T.Parser GetWebPagePreview
   parseGetWebPagePreview = A.withObject "GetWebPagePreview" $ \o -> do
    text <- o A..:? "text"
    return $ GetWebPagePreview { text = text }
 parseJSON _ = mempty
