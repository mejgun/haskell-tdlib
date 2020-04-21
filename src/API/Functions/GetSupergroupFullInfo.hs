-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSupergroupFullInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetSupergroupFullInfo = 
 GetSupergroupFullInfo { supergroup_id :: Int }  deriving (Show)

instance T.ToJSON GetSupergroupFullInfo where
 toJSON (GetSupergroupFullInfo { supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "getSupergroupFullInfo", "supergroup_id" A..= supergroup_id ]



instance T.FromJSON GetSupergroupFullInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSupergroupFullInfo" -> parseGetSupergroupFullInfo v

   _ -> mempty ""
  where
   parseGetSupergroupFullInfo :: A.Value -> T.Parser GetSupergroupFullInfo
   parseGetSupergroupFullInfo = A.withObject "GetSupergroupFullInfo" $ \o -> do
    supergroup_id <- o A..: "supergroup_id"
    return $ GetSupergroupFullInfo { supergroup_id = supergroup_id }