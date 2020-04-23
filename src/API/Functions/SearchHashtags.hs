-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchHashtags where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SearchHashtags = 
 SearchHashtags { limit :: Maybe Int, prefix :: Maybe String }  deriving (Show)

instance T.ToJSON SearchHashtags where
 toJSON (SearchHashtags { limit = limit, prefix = prefix }) =
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
    limit <- optional $ o A..: "limit"
    prefix <- optional $ o A..: "prefix"
    return $ SearchHashtags { limit = limit, prefix = prefix }