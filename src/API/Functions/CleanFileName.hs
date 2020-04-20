-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CleanFileName where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CleanFileName = 
 CleanFileName { file_name :: String }  -- deriving (Show)

instance T.ToJSON CleanFileName where
 toJSON (CleanFileName { file_name = file_name }) =
  A.object [ "@type" A..= T.String "cleanFileName", "file_name" A..= file_name ]
-- cleanFileName CleanFileName  { file_name :: String } 

