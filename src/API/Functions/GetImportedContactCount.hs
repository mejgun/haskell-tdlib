-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetImportedContactCount where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetImportedContactCount = 
 GetImportedContactCount -- deriving (Show)

instance T.ToJSON GetImportedContactCount where
 toJSON (GetImportedContactCount {  }) =
  A.object [ "@type" A..= T.String "getImportedContactCount" ]
-- getImportedContactCount GetImportedContactCount 



instance T.FromJSON GetImportedContactCount where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getImportedContactCount" -> parseGetImportedContactCount v
  where
   parseGetImportedContactCount :: A.Value -> T.Parser GetImportedContactCount
   parseGetImportedContactCount = A.withObject "GetImportedContactCount" $ \o -> do
    return $ GetImportedContactCount {  }