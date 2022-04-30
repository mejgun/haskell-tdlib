-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveRecentHashtag where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Removes a hashtag from the list of recently used hashtags 
-- 
-- __hashtag__ Hashtag to delete
data RemoveRecentHashtag = 

 RemoveRecentHashtag { hashtag :: Maybe String }  deriving (Eq)

instance Show RemoveRecentHashtag where
 show RemoveRecentHashtag { hashtag=hashtag } =
  "RemoveRecentHashtag" ++ U.cc [U.p "hashtag" hashtag ]

instance T.ToJSON RemoveRecentHashtag where
 toJSON RemoveRecentHashtag { hashtag = hashtag } =
  A.object [ "@type" A..= T.String "removeRecentHashtag", "hashtag" A..= hashtag ]

instance T.FromJSON RemoveRecentHashtag where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeRecentHashtag" -> parseRemoveRecentHashtag v
   _ -> mempty
  where
   parseRemoveRecentHashtag :: A.Value -> T.Parser RemoveRecentHashtag
   parseRemoveRecentHashtag = A.withObject "RemoveRecentHashtag" $ \o -> do
    hashtag <- o A..:? "hashtag"
    return $ RemoveRecentHashtag { hashtag = hashtag }
 parseJSON _ = mempty
