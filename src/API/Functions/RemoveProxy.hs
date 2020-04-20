-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveProxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RemoveProxy = 
 RemoveProxy { proxy_id :: Int }  -- deriving (Show)

instance T.ToJSON RemoveProxy where
 toJSON (RemoveProxy { proxy_id = proxy_id }) =
  A.object [ "@type" A..= T.String "removeProxy", "proxy_id" A..= proxy_id ]
-- removeProxy RemoveProxy  { proxy_id :: Int } 



instance T.FromJSON RemoveProxy where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeProxy" -> parseRemoveProxy v
  where
   parseRemoveProxy :: A.Value -> T.Parser RemoveProxy
   parseRemoveProxy = A.withObject "RemoveProxy" $ \o -> do
    proxy_id <- o A..: "proxy_id"
    return $ RemoveProxy { proxy_id = proxy_id }