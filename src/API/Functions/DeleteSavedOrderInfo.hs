-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteSavedOrderInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DeleteSavedOrderInfo = 
 DeleteSavedOrderInfo -- deriving (Show)

instance T.ToJSON DeleteSavedOrderInfo where
 toJSON (DeleteSavedOrderInfo {  }) =
  A.object [ "@type" A..= T.String "deleteSavedOrderInfo" ]
-- deleteSavedOrderInfo DeleteSavedOrderInfo 



instance T.FromJSON DeleteSavedOrderInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteSavedOrderInfo" -> parseDeleteSavedOrderInfo v
  where
   parseDeleteSavedOrderInfo :: A.Value -> T.Parser DeleteSavedOrderInfo
   parseDeleteSavedOrderInfo = A.withObject "DeleteSavedOrderInfo" $ \o -> do
    return $ DeleteSavedOrderInfo {  }