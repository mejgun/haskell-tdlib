-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Text where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains some text 
-- 
-- __text__ Text
data Text = 

 Text { text :: Maybe String }  deriving (Eq)

instance Show Text where
 show Text { text=text } =
  "Text" ++ cc [p "text" text ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Text where
 toJSON Text { text = text } =
  A.object [ "@type" A..= T.String "text", "text" A..= text ]

instance T.FromJSON Text where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "text" -> parseText v
   _ -> mempty
  where
   parseText :: A.Value -> T.Parser Text
   parseText = A.withObject "Text" $ \o -> do
    text <- o A..:? "text"
    return $ Text { text = text }
 parseJSON _ = mempty
