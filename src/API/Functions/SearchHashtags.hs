-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchHashtags where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Searches for recently used hashtags by their prefix 
-- 
-- __prefix__ Hashtag prefix to search for
-- 
-- __limit__ The maximum number of hashtags to be returned
data SearchHashtags = 

 SearchHashtags { limit :: Maybe Int, prefix :: Maybe String }  deriving (Eq)

instance Show SearchHashtags where
 show SearchHashtags { limit=limit, prefix=prefix } =
  "SearchHashtags" ++ cc [p "limit" limit, p "prefix" prefix ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SearchHashtags where
 toJSON SearchHashtags { limit = limit, prefix = prefix } =
  A.object [ "@type" A..= T.String "searchHashtags", "limit" A..= limit, "prefix" A..= prefix ]

instance T.FromJSON SearchHashtags where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchHashtags" -> parseSearchHashtags v
   _ -> mempty
  where
   parseSearchHashtags :: A.Value -> T.Parser SearchHashtags
   parseSearchHashtags = A.withObject "SearchHashtags" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    prefix <- o A..:? "prefix"
    return $ SearchHashtags { limit = limit, prefix = prefix }
 parseJSON _ = mempty
