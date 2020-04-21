-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetUserFullInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetUserFullInfo = 
 GetUserFullInfo { user_id :: Int }  deriving (Show)

instance T.ToJSON GetUserFullInfo where
 toJSON (GetUserFullInfo { user_id = user_id }) =
  A.object [ "@type" A..= T.String "getUserFullInfo", "user_id" A..= user_id ]



instance T.FromJSON GetUserFullInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getUserFullInfo" -> parseGetUserFullInfo v

   _ -> mempty ""
  where
   parseGetUserFullInfo :: A.Value -> T.Parser GetUserFullInfo
   parseGetUserFullInfo = A.withObject "GetUserFullInfo" $ \o -> do
    user_id <- o A..: "user_id"
    return $ GetUserFullInfo { user_id = user_id }