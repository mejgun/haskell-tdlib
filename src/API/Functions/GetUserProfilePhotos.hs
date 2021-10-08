-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetUserProfilePhotos where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns the profile photos of a user. The result of this query may be outdated: some photos might have been deleted already 
-- 
-- __user_id__ User identifier
-- 
-- __offset__ The number of photos to skip; must be non-negative
-- 
-- __limit__ The maximum number of photos to be returned; up to 100
data GetUserProfilePhotos = 

 GetUserProfilePhotos { limit :: Maybe Int, offset :: Maybe Int, user_id :: Maybe Int }  deriving (Eq)

instance Show GetUserProfilePhotos where
 show GetUserProfilePhotos { limit=limit, offset=offset, user_id=user_id } =
  "GetUserProfilePhotos" ++ cc [p "limit" limit, p "offset" offset, p "user_id" user_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetUserProfilePhotos where
 toJSON GetUserProfilePhotos { limit = limit, offset = offset, user_id = user_id } =
  A.object [ "@type" A..= T.String "getUserProfilePhotos", "limit" A..= limit, "offset" A..= offset, "user_id" A..= user_id ]

instance T.FromJSON GetUserProfilePhotos where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getUserProfilePhotos" -> parseGetUserProfilePhotos v
   _ -> mempty
  where
   parseGetUserProfilePhotos :: A.Value -> T.Parser GetUserProfilePhotos
   parseGetUserProfilePhotos = A.withObject "GetUserProfilePhotos" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset <- mconcat [ o A..:? "offset", readMaybe <$> (o A..: "offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetUserProfilePhotos { limit = limit, offset = offset, user_id = user_id }
 parseJSON _ = mempty
