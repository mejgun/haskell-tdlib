-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteAccount where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DeleteAccount = 
 DeleteAccount { reason :: String }  deriving (Show)

instance T.ToJSON DeleteAccount where
 toJSON (DeleteAccount { reason = reason }) =
  A.object [ "@type" A..= T.String "deleteAccount", "reason" A..= reason ]



instance T.FromJSON DeleteAccount where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteAccount" -> parseDeleteAccount v

   _ -> mempty ""
  where
   parseDeleteAccount :: A.Value -> T.Parser DeleteAccount
   parseDeleteAccount = A.withObject "DeleteAccount" $ \o -> do
    reason <- o A..: "reason"
    return $ DeleteAccount { reason = reason }