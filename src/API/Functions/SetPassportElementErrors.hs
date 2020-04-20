-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetPassportElementErrors where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputPassportElementError as InputPassportElementError

--main = putStrLn "ok"

data SetPassportElementErrors = 
 SetPassportElementErrors { errors :: [InputPassportElementError.InputPassportElementError], user_id :: Int }  -- deriving (Show)

instance T.ToJSON SetPassportElementErrors where
 toJSON (SetPassportElementErrors { errors = errors, user_id = user_id }) =
  A.object [ "@type" A..= T.String "setPassportElementErrors", "errors" A..= errors, "user_id" A..= user_id ]
-- setPassportElementErrors SetPassportElementErrors  { errors :: [InputPassportElementError.InputPassportElementError], user_id :: Int } 

