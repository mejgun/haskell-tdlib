-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetUser where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetUser = 
 GetUser { user_id :: Maybe Int }  deriving (Show)

instance T.ToJSON GetUser where
 toJSON (GetUser { user_id = user_id }) =
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
    user_id <- optional $ o A..: "user_id"
    return $ GetUser { user_id = user_id }