-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetFileMimeType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetFileMimeType = 
 GetFileMimeType { file_name :: String }  -- deriving (Show)

instance T.ToJSON GetFileMimeType where
 toJSON (GetFileMimeType { file_name = file_name }) =
  A.object [ "@type" A..= T.String "getFileMimeType", "file_name" A..= file_name ]
-- getFileMimeType GetFileMimeType  { file_name :: String } 



instance T.FromJSON GetFileMimeType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getFileMimeType" -> parseGetFileMimeType v
  where
   parseGetFileMimeType :: A.Value -> T.Parser GetFileMimeType
   parseGetFileMimeType = A.withObject "GetFileMimeType" $ \o -> do
    file_name <- o A..: "file_name"
    return $ GetFileMimeType { file_name = file_name }