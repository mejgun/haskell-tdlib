-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetBlockedUsers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetBlockedUsers = 
 GetBlockedUsers { limit :: Int, offset :: Int }  -- deriving (Show)

instance T.ToJSON GetBlockedUsers where
 toJSON (GetBlockedUsers { limit = limit, offset = offset }) =
  A.object [ "@type" A..= T.String "getBlockedUsers", "limit" A..= limit, "offset" A..= offset ]
-- getBlockedUsers GetBlockedUsers  { limit :: Int, offset :: Int } 



instance T.FromJSON GetBlockedUsers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getBlockedUsers" -> parseGetBlockedUsers v
  where
   parseGetBlockedUsers :: A.Value -> T.Parser GetBlockedUsers
   parseGetBlockedUsers = A.withObject "GetBlockedUsers" $ \o -> do
    limit <- o A..: "limit"
    offset <- o A..: "offset"
    return $ GetBlockedUsers { limit = limit, offset = offset }