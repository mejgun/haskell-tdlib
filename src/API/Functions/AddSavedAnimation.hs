-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddSavedAnimation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data AddSavedAnimation = 
 AddSavedAnimation { animation :: InputFile.InputFile }  -- deriving (Show)

instance T.ToJSON AddSavedAnimation where
 toJSON (AddSavedAnimation { animation = animation }) =
  A.object [ "@type" A..= T.String "addSavedAnimation", "animation" A..= animation ]
-- addSavedAnimation AddSavedAnimation  { animation :: InputFile.InputFile } 

