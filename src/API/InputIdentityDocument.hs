-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputIdentityDocument where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile
import {-# SOURCE #-} qualified API.Date as Date

--main = putStrLn "ok"

data InputIdentityDocument = 
 InputIdentityDocument { translation :: [InputFile.InputFile], selfie :: InputFile.InputFile, reverse_side :: InputFile.InputFile, front_side :: InputFile.InputFile, expiry_date :: Date.Date, number :: String }  -- deriving (Show)

instance T.ToJSON InputIdentityDocument where
 toJSON (InputIdentityDocument { translation = translation, selfie = selfie, reverse_side = reverse_side, front_side = front_side, expiry_date = expiry_date, number = number }) =
  A.object [ "@type" A..= T.String "inputIdentityDocument", "translation" A..= translation, "selfie" A..= selfie, "reverse_side" A..= reverse_side, "front_side" A..= front_side, "expiry_date" A..= expiry_date, "number" A..= number ]
-- inputIdentityDocument InputIdentityDocument  { translation :: [InputFile.InputFile], selfie :: InputFile.InputFile, reverse_side :: InputFile.InputFile, front_side :: InputFile.InputFile, expiry_date :: Date.Date, number :: String } 

