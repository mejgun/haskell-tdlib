-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteSavedCredentials where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DeleteSavedCredentials = 
 DeleteSavedCredentials -- deriving (Show)

instance T.ToJSON DeleteSavedCredentials where
 toJSON (DeleteSavedCredentials {  }) =
  A.object [ "@type" A..= T.String "deleteSavedCredentials" ]
-- deleteSavedCredentials DeleteSavedCredentials 



instance T.FromJSON DeleteSavedCredentials where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteSavedCredentials" -> parseDeleteSavedCredentials v
  where
   parseDeleteSavedCredentials :: A.Value -> T.Parser DeleteSavedCredentials
   parseDeleteSavedCredentials = A.withObject "DeleteSavedCredentials" $ \o -> do
    return $ DeleteSavedCredentials {  }