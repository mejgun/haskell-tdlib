-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetFileExtension where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetFileExtension = 
 GetFileExtension { mime_type :: String }  deriving (Show)

instance T.ToJSON GetFileExtension where
 toJSON (GetFileExtension { mime_type = mime_type }) =
  A.object [ "@type" A..= T.String "getFileExtension", "mime_type" A..= mime_type ]



instance T.FromJSON GetFileExtension where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getFileExtension" -> parseGetFileExtension v

   _ -> mempty ""
  where
   parseGetFileExtension :: A.Value -> T.Parser GetFileExtension
   parseGetFileExtension = A.withObject "GetFileExtension" $ \o -> do
    mime_type <- o A..: "mime_type"
    return $ GetFileExtension { mime_type = mime_type }