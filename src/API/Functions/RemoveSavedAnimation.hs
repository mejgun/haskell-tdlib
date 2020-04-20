-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveSavedAnimation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data RemoveSavedAnimation = 
 RemoveSavedAnimation { animation :: InputFile.InputFile }  -- deriving (Show)

instance T.ToJSON RemoveSavedAnimation where
 toJSON (RemoveSavedAnimation { animation = animation }) =
  A.object [ "@type" A..= T.String "removeSavedAnimation", "animation" A..= animation ]
-- removeSavedAnimation RemoveSavedAnimation  { animation :: InputFile.InputFile } 

