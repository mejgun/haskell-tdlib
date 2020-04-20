-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetUser where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetUser = 
 GetUser { user_id :: Int }  -- deriving (Show)

instance T.ToJSON GetUser where
 toJSON (GetUser { user_id = user_id }) =
  A.object [ "@type" A..= T.String "getUser", "user_id" A..= user_id ]
-- getUser GetUser  { user_id :: Int } 



instance T.FromJSON GetUser where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getUser" -> parseGetUser v
  where
   parseGetUser :: A.Value -> T.Parser GetUser
   parseGetUser = A.withObject "GetUser" $ \o -> do
    user_id <- o A..: "user_id"
    return $ GetUser { user_id = user_id }