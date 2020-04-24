-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetFileMimeType where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetFileMimeType = 
 GetFileMimeType { file_name :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetFileMimeType where
 toJSON (GetFileMimeType { file_name = file_name }) =
  A.object [ "@type" A..= T.String "getFileMimeType", "file_name" A..= file_name ]

instance T.FromJSON GetFileMimeType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getFileMimeType" -> parseGetFileMimeType v
   _ -> mempty
  where
   parseGetFileMimeType :: A.Value -> T.Parser GetFileMimeType
   parseGetFileMimeType = A.withObject "GetFileMimeType" $ \o -> do
    file_name <- optional $ o A..: "file_name"
    return $ GetFileMimeType { file_name = file_name }