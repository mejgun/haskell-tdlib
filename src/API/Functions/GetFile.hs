-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetFile where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetFile = 
 GetFile { file_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetFile where
 toJSON (GetFile { file_id = file_id }) =
  A.object [ "@type" A..= T.String "getFile", "file_id" A..= file_id ]

instance T.FromJSON GetFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getFile" -> parseGetFile v
   _ -> mempty
  where
   parseGetFile :: A.Value -> T.Parser GetFile
   parseGetFile = A.withObject "GetFile" $ \o -> do
    file_id <- optional $ o A..: "file_id"
    return $ GetFile { file_id = file_id }