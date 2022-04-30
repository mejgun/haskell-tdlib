-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetUser where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns information about a user by their identifier. This is an offline request if the current user is not a bot 
-- 
-- __user_id__ User identifier
data GetUser = 

 GetUser { user_id :: Maybe Int }  deriving (Eq)

instance Show GetUser where
 show GetUser { user_id=user_id } =
  "GetUser" ++ U.cc [U.p "user_id" user_id ]

instance T.ToJSON GetUser where
 toJSON GetUser { user_id = user_id } =
  A.object [ "@type" A..= T.String "getUser", "user_id" A..= user_id ]

instance T.FromJSON GetUser where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getUser" -> parseGetUser v
   _ -> mempty
  where
   parseGetUser :: A.Value -> T.Parser GetUser
   parseGetUser = A.withObject "GetUser" $ \o -> do
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetUser { user_id = user_id }
 parseJSON _ = mempty
