-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CleanFileName where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CleanFileName = 
 CleanFileName { file_name :: Maybe String }  deriving (Show)

instance T.ToJSON CleanFileName where
 toJSON (CleanFileName { file_name = file_name }) =
  A.object [ "@type" A..= T.String "cleanFileName", "file_name" A..= file_name ]

instance T.FromJSON CleanFileName where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "cleanFileName" -> parseCleanFileName v
   _ -> mempty
  where
   parseCleanFileName :: A.Value -> T.Parser CleanFileName
   parseCleanFileName = A.withObject "CleanFileName" $ \o -> do
    file_name <- optional $ o A..: "file_name"
    return $ CleanFileName { file_name = file_name }